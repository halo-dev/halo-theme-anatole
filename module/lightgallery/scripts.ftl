<script type="text/javascript">
    const imageNodes = document.querySelectorAll('#post-content img');
    imageNodes.forEach(function (node) {
        if (node) {
            node.dataset.src = node.src;
        }
    })

    const disableLightGalleryNodes = document.querySelectorAll('#post-content div.disable-lightgallery-all img, #post-content a img, #post-content button img');
    disableLightGalleryNodes.forEach(function (node) {
        if (node) {
            node.classList.add("disable-lightgallery")
        }
    })

    lightGallery(document.getElementById('post-content'), {
        selector: 'img:not(.disable-lightgallery)',
    })
</script>