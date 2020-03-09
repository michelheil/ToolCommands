## Get dependency tree
mvn dependency:tree -Dverbose

## Exclude certain libraries out of a dependency
<dependency>
  <groupId>com.daimler.mbb.ebip.dp</groupId>
  <artifactId>lib-commons</artifactId>
  <version>${lib-commons.version}</version>
    <exclusions>
      <exclusion>
        <groupId>org.eclipse.jetty</groupId>
        <artifactId>jetty-util</artifactId>
      </exclusion>
  </exclusions>
</dependency>
