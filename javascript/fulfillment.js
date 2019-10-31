(function () {
    let markedAsFulfilled = [];
    // Add Click even listener to print 
    let icons = document.querySelectorAll('.print-icon');
    icons.forEach((icon) => {
        icon.addEventListener('click', (e) => {
            e.preventDefault();
            // Create Print view for selected order
            let rowToPrint = e.target.parentNode.parentNode.parentNode;
           console.log(rowToPrint);
            let newWin = window.open("");
            newWin.document.write(rowToPrint.outerHTML);
            newWin.print();
            newWin.close();
        });
    });

    // Add Change event listener to print 
    let checkboxes = document.querySelectorAll('.fulfillable-checkbox');
    checkboxes.forEach((checkbox)=>{
       checkbox.addEventListener('change', (e) => {
           let id = event.target.parentNode.parentNode.parentNode.children[0].innerHTML;
            if (event.target.checked) {
                // Get Shipment id in row selected and add it to marked as filfilled array
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
        const url = '/api/update.php';
        const data = { orderids: markedAsFulfilled };

        fetch(url, {  
            method: 'POST',  
             body: JSON.stringify(data)
        })
        .then(function (response) {
            return response.text();
          })
          .then(function (body) {
            console.log(body);
          });
    });
    
})();