<script type="text/javascript" src="${theme_base!}/dist/main.umd.js"></script>
<script type="text/javascript">
    const url = location.href;
    let urlstatus = false;
    const menuItems = document.querySelectorAll(".nav li a")
    menuItems.forEach(function (node) {
        if ((url + '/').indexOf(node.getAttribute('href')) > -1 && node.getAttribute('href') !== '/') {
            node.classList.add('current');
            urlstatus = true;
        } else {
            node.classList.remove('current');
        }
    });
    if (!urlstatus) {
        menuItems[0].classList.add('current');
    }
</script>