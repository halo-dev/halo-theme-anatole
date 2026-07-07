import Alpine from "alpinejs";

import upvote from "../alpine-data/upvote";

Alpine.data("upvote", upvote);

window.Alpine = Alpine;

Alpine.start();
