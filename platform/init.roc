main : { url : Str } -> List { name : Str, content : Str }
main = \args ->
  [{ name : "app.roc", content: "app [main] { pf: platform \"$(args.url)\" }\n\n# Can segfault on some Ubuntu 20.04 CI machines, see #164.\nmain = \"Roc <3 Go!\"\n" }]
