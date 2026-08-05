--[[
Drop the column widths pandoc infers from the width of the ASCII art in a grid
table, so LaTeX and HTML size each column to its contents instead.

Without this, one wide cell stretches its column to a large fraction of the
text block and strands the row label off on the left. In chapter 3 the cell
$\langle U, 0.5; D, 0.5 \rangle$ is 32 characters, which gave its column about
half the page while U, M and D sat right-aligned at the far end of it.

Quarto's own tbl-colwidths option does not help here: it governs widths you
specify, not the ones pandoc infers from the source, and setting it to false
leaves the p{} specs in place.

Alignment is preserved. Only the widths go.
]]

function Table(t)
  if t.colspecs then                    -- pandoc 2.10 and later
    for i, spec in ipairs(t.colspecs) do
      t.colspecs[i] = { spec[1], nil }  -- keep the alignment, drop the width
    end
  elseif t.widths then                  -- pandoc 2.9 and earlier
    for i = 1, #t.widths do
      t.widths[i] = 0                   -- 0 means "no explicit width"
    end
  end
  return t
end
