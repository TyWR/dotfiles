command: "ESC=`printf \"\e\"`; ps -A -o %cpu | awk '{s+=$1} END {printf(\"%.2f\",s/8);}'"

refreshFrequency: 5000 # ms

render: (output) ->
  """
  <div class="cpu"
    <span></span>
    <span></span>
  </div>
  """

bar: (output) =>
    return if output > 80
        "cpu[|||||]"
    else if output > 60
        "cpu[||||&nbsp;]"
    else if output > 40
        "cpu[|||&nbsp;&nbsp;]"
    else if output > 20
        "cpu[||&nbsp;&nbsp;&nbsp;]"
    else
        "cpu[|&nbsp;&nbsp;&nbsp;&nbsp;]"

update: (output, el) ->
  $(".cpu span", el).html(@bar(output))

style: """
  font:17px "Terminus (TTF)"
  font-weight: bold
  top: 0px
  right: 190px
"""
