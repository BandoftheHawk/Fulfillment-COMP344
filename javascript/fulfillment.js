(function () {
    // Add Click even listener to print icons
    let icons = document.querySelectorAll('.print-icon');
    icons.forEach((icon) => {
        icon.addEventListener('click', (e) => {
            e.preventDefault();
            let rowToPrint = e.target.parentNode.parentNode.parentNode;
           console.log(rowToPrint);
            let newWin = window.open("");
            newWin.document.write(rowToPrint.outerHTML);
            // newWin.print();
            // newWin.close();
        });
    });

})();
