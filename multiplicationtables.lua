-- Default for blankValues is false
function drawLine(x1, y1, x2, y2, lineOptions)
  tex.print( [[ \draw[ ]] .. (lineOptions or "") .. "] (" .. x1 .. "," .. y1 .. ") -- (" .. x2 .. "," .. y2 .. ");")
end

function drawText(x1, y1, text)
  tex.print( [[ \node at (]] .. x1 .. "," .. y1 .. [[) {]] .. text .. [[};]])
end

-- Default for blankValues is false
function mtableWithTikz(xTable, yTable, blankValues, xScale, yScale)
  -- TODO add check that yTable is not empty

  -- if #xTable ~= 10 then
  --   error("There are not 10 numbers in your x list.")
  -- end
  -- if #yTable ~= 10 then
  --   error("There are not 10 numbers in your y list.")
  -- end

  tex.print( [[ \begin{tikzpicture}]]
      .. "[y=" .. yScale .. [[,x=]] .. xScale .. [[] ]]
  )

  timesSize = 0.15
  drawLine(0.5-timesSize, 0.5-timesSize, 0.5+timesSize, 0.5+timesSize, "very thick")
  drawLine(0.5-timesSize, 0.5+timesSize, 0.5+timesSize, 0.5-timesSize, "very thick")

  for x=1,#xTable do
    drawText(x+.5, 0.5, xTable[x])
  end
  for y=1,#yTable do
    drawText(0.5, y+.5, yTable[y])
  end
  -- The main drawing loops
  for x=1,#xTable do
    for y=1,#yTable do
      if x==1 then
        drawLine(x, 0, x, #yTable+1, "very thick")
      else
        drawLine(x, 0, x, #yTable+1)
      end
      if y==1 then
        drawLine(0, y, #xTable+1, y, "very thick")
      else
        drawLine(0, y, #xTable+1, y)
      end

      -- The multiplication
      if not blankValues then
        drawText(x+.5,y+.5,xTable[x]*yTable[y])
      end
    end
  end
  tex.print( [[ \end{tikzpicture} ]])
end
