interface PostState {
  upvotedNames: string[];
  init(): void;
  upvoted(id: string): boolean;
  handleUpvote(name: string): void;
}

export default (): PostState => ({
  upvotedNames: [],
  init() {
    this.upvotedNames = JSON.parse(localStorage.getItem("anatole.upvoted.post.names") || "[]");
  },
  upvoted(id: string) {
    return this.upvotedNames.includes(id);
  },
  async handleUpvote(name) {
    if (this.upvoted(name)) {
      return;
    }

    const xhr = new XMLHttpRequest();

    xhr.open("POST", "/apis/api.halo.run/v1alpha1/trackers/upvote");
    xhr.setRequestHeader("Content-Type", "application/json");

    xhr.onload = () => {
      this.upvotedNames = [...this.upvotedNames, name];
      localStorage.setItem("anatole.upvoted.post.names", JSON.stringify(this.upvotedNames));

      const upvoteNode = document.querySelector('[data-upvote-post-name="' + name + '"]');

      if (!upvoteNode) {
        return;
      }

      const upvoteCount = parseInt(upvoteNode.textContent || "0");
      upvoteNode.textContent = upvoteCount + 1 + "";
    };
    xhr.onerror = function () {
      alert("网络请求失败，请稍后再试");
    };
    xhr.send(
      JSON.stringify({
        group: "content.halo.run",
        plural: "posts",
        name: name,
      })
    );
  },
});
