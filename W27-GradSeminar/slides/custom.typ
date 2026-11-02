// Provide a generic alt text for equations so PDF/UA-1 is satisfied.
// Override individual equations with explicit alt when better
// accessibility matters, e.g. with #math.equation(alt: "the sum of a and b")[$a + b$].
#set math.equation(alt: "mathematical expression")

// Bold the first row of every table, since Touying does not auto-bold
// markdown table headers the way revealjs and beamer do.
#show table.cell.where(y: 0): strong
