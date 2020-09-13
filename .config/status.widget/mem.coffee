command: "ESC=`printf \"\e\"`; ps -A -o %mem | awk '{s+=$1} END {print \"\" s}'"

refreshFrequency: 5000 # ms

render: (output) ->
  """
  <div class="mem"
    <span></span>
    <span></span>
  </div>
  """

bar: (output) =>
    return if output > 80
        "mem[|||||]"
    else if output > 60
        "mem[||||&nbsp;]"
    else if output > 40
        "mem[|||&nbsp;&nbsp;]"
    else if output > 20
        "mem[||&nbsp;&nbsp;&nbsp;]"
    else
        "mem[|&nbsp;&nbsp;&nbsp;&nbsp;]"

update: (output, el) ->
  $(".mem span", el).html(@bar(output))

style: """
  font:17px "Terminus (TTF)"
  font-weight: bold
  top: 0px
  right: 80px
"""
