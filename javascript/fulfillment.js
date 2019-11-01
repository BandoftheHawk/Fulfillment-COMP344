(function () {
    let markedAsFulfilled = []; // Selected rows will be stored here
    // Add Click even listener to print 
    let icons = document.querySelectorAll('.print-icon');
    icons.forEach((icon) => {
        icon.addEventListener('click', (e) => { //Assign an event to each icon
            e.preventDefault();
            let rowToPrintId = event.target.parentNode.parentNode.parentNode.children[0].innerHTML;
            // If the print btn is clicked, we will load print.php page. 
            // This page will return us our shipment information in html. We load a window with that html.
            // Once the window is loaded, we call window.print() to load the printer popup 
            $('#shipment').load('./print.php?shipmentId='+rowToPrintId,function(){
                var printContent = document.getElementById('shipment');
                var WinPrint = window.open('', '', 'width=1000,height=650');
                WinPrint.document.write(printContent.innerHTML);
                WinPrint.document.close();
                WinPrint.focus();
                setTimeout(() => {
                    WinPrint.print();
                    WinPrint.close();
                }, 200)
                
            });          
        });
    });
    

    // Add Change event listener to store the selected shipment rows
    let checkboxes = document.querySelectorAll('.fulfillable-checkbox');
    checkboxes.forEach((checkbox)=>{
       checkbox.addEventListener('change', (e) => {
           let id = event.target.parentNode.parentNode.parentNode.children[0].innerHTML;
            if (event.target.checked) {
                // Get Shipment id in row selected and add it to marked as fulfilled array
                markedAsFulfilled.push(id);
            } else {
                // get shipment id in row selected and remove it from marked as fulfilled array
                let index = markedAsFulfilled.indexOf(id);
                if (index !== -1) markedAsFulfilled.splice(index, 1);
            }
            
        })
    })

    // Attempt to fulfill marked orders in marked orders array
    document.querySelector('#process').addEventListener('click', (e) => {
        const url = '/api/update.php'; // Our business logic to change shipment status 
        const data = { shipmentIds: markedAsFulfilled }; // Array of shipment ids
        fetch(url, {  
            method: 'POST',  
            body: JSON.stringify(data)
        })
        .then(function (response) { 
          // Then is like a callback in promises.
          //  Once result is returned a nd it is successful we reload the location
            location.reload(true);
            return true;
          });
    });
    
})();

$(document).ready(function(){
   
});