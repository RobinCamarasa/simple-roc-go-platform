app [main] { pf: platform "https://github.com/RobinCamarasa/init-roc-platform/releases/download/0.0.1/d_cs0ZxHfYwyLuR0wpMhcaGbTj1eT9ctiT14j_Mjj3Q.tar.br" }

main : { url : Str } -> List { name : Str, content : Str }
main = \args ->
  [{ name : "app.roc", content: "app [main] { pf: platform \"$(args.url)\" }\n\n# Can segfault on some Ubuntu 20.04 CI machines, see #164.\nmain = \"Roc <3 Go!\"\n" }]
