(function () {
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

    // Attempt to fulfill marked orders
    document.querySelector('#process').addEventListener('click', (e) => {
        console.log('make api call to process row');
    });

    
    // document.getElementById('registrationform').onsubmit = function(e){
    //     return validate();
    // }
    // function validate(){
    
    // }

})();
