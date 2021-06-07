document.addEventListener('DOMContentLoaded', () => {
            
    document.querySelectorAll('.jss1007').forEach((button) => {
       button.addEventListener('mouseover', () => {
        let buttonChild = button.children
        
        buttonChild[0].style.color = 'rgba(236, 36, 57, 1)'
       })

       button.addEventListener('mouseout', () => {
        let buttonChild = button.children
        
        buttonChild[0].style.color = 'rgba(60, 60, 67, 0.6)'
       })
    })

})