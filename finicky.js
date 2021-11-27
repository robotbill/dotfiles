module.exports = {
  defaultBrowser: "Firefox",
  handlers: [
    {
      match: finicky.matchHostnames(["meet.google.com"]),
      browser: "Google Meet"
    },
    {
      match: [
        "zoom.us/*",
        finicky.matchDomains(/.*\zoom.us/),
        /zoom.us\/j\//,
      ],
      browser: "us.zoom.xos"
    },
    {
      match: [
        finicky.matchDomains(/prod.liveshare.vsengsaas.visualstudio.com/)
      ],
      browser: "Visual Studio Code"
    }
  ]
}
