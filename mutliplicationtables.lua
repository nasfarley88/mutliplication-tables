
-- Default for blankValues is false
function mtable (xTable, yTable, blankValues, useColor)
  -- TODO add check that yTable is not empty

  if #xTable ~= 10 then
    error("There are not 10 numbers in your x list.")
  end
  if #yTable ~= 10 then
    error("There are not 10 numbers in your y list.")
  end

  -- Begin table
  tex.print( [[ \begin{tabular}{Q"Q|Q|Q|Q|Q|Q|Q|Q|Q|Q} ]] )
  for i=0,10 do
    if i==0 then
      tex.print( [[$\times$]] )
    else
      if i % 2 == 1 and useColor then
        tex.print([[\cellcolor{gray!20} ]])
      end
      tex.print(yTable[i])
    end
    for j=1,10 do
      -- Always create the &
      tex.print([[& ]])
      if i % 2 == 1 and j % 2 == 1 and useColor then
        tex.print([[\cellcolor{gray!40} ]])
      elseif (i % 2 == 1 or j % 2 == 1) and useColor then
        tex.print([[\cellcolor{gray!20} ]])
      end
      -- first row? print the actual values
      if i==0 then
        tex.print(xTable[j])
      else
        -- Should be blank? do nothing. Otherwise, fill the answers
        if blankValues then
        else
          tex.print(xTable[j]*yTable[i])
        end
      end
    end
    if i==0 then
      tex.print( [[\\\thickhline]] )
    elseif i==10 then
    else
      tex.print( [[\\\hline]])
    end
  end
  tex.print([[\end{tabular}]])
end
