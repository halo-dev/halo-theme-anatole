<script>
    document.addEventListener("alpine:init", () => {
        Alpine.data("posts", () => ({
            likedIds: [],
            init() {
                this.likedIds = JSON.parse(localStorage.getItem("anatole.likes.post.ids") || "[]");
            },
            liked(id) {
                return this.likedIds.includes(id);
            },
            async handleLike(postId) {
                if (this.liked(postId)) {
                    return
                }

                const xhr = new XMLHttpRequest();

                xhr.open('POST', "/api/content/posts/" + postId + "/likes");

                xhr.onload = () => {
                    this.likedIds = [...this.likedIds, postId];
                    localStorage.setItem('anatole.likes.post.ids', JSON.stringify(this.likedIds));

                    const likesNode = document.querySelector("[data-post-id-likes=\"" + postId + "\"]");
                    const likes = parseInt(likesNode.innerText);
                    likesNode.innerText = likes + 1;
                }
                xhr.onerror = function () {
                    alert("网络请求失败，请稍后再试");
                };
                xhr.send();
            }
        }))
    })
</script>