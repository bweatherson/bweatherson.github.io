function Header(el)
  return el
end

function Table(tbl)
  -- Add scope="col" to all header cells
  if tbl.head and tbl.head.rows then
    for _, row in ipairs(tbl.head.rows) do
      for _, cell in ipairs(row.cells) do
        if not cell.attr then
          cell.attr = pandoc.Attr()
        end
        cell.attr.attributes.scope = "col"
      end
    end
  end
  return tbl
end
