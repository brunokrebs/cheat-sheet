## Spring Initializr Commands

```bash
curl https://start.spring.io/starter.tgz \
  -d bootVersion=2.0.0.M6 \
  -d dependencies=web,data-mongodb-reactive \
  -d type=gradle-project \
  -d baseDir=spring-reactive-chat \
  | tar -xzvf -
```
