export default {
  defaultBrowser: "Firefox",
  handlers: [
    {
      match: /meet.google.com/,
      browser: "Google Chrome"
    },
    {
      match: /.*\.zoom\.us\/j\/.*/,
      browser: "us.zoom.xos"
    },
    {
      match: /prod.liveshare.vsengsaas.visualstudio.com/,
      browser: "Visual Studio Code"
    }
  ]
}
