module.exports = {
    mode: "jit",
    content: ["./*.ftl", "./module/*.ftl"],
    theme: {
        extend: {},
    },
    plugins: [
        require('@tailwindcss/aspect-ratio'),
        require('@tailwindcss/forms'),
    ],
    safelist: ['animate-bounce']
}
