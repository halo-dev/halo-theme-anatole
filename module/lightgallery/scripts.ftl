<script type="text/javascript">
    const imageNodes = document.querySelectorAll('#post-content img');
    imageNodes.forEach(function (node) {
        if (node) {
            node.dataset.src = node.src;
        }
    })

    lightGallery(document.getElementById('post-content'), {
        selector: 'img',
    })
</script>