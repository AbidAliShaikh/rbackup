Title
========================================================

This is an R Markdown document. Markdown is a simple formatting syntax for authoring web pages (click the **MD** toolbar button for help on Markdown).

When you click the **Knit HTML** button a web page will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
require(RODBC)
conn = odbcConnectExcel("myfile.xlsx") # open a connection to the Excel file
sqlTables(conn)$TABLE_NAME # show all sheets
df = sqlFetch(conn, "Sheet1") # read a sheet
df = sqlQuery(conn, "select * from [Sheet1 $]") # read a sheet (alternative SQL sintax)
close(conn) # close the connection to the file
```

You can also embed plots, for example:

```{r fig.width=7, fig.height=6}
plot(cars)
```

