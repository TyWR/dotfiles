command: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'"

refreshFrequency: 15000 # ms

render: (output) ->
  """
  <div class="battery"
    <span></span>
    <span></span>
  </div>
  """

update: (output, el) ->
    $(".battery span:first-child", el).text("#{output}")

style: """
  .battery
    font-size: 12px
    font: 17px "Terminus (TTF)"
    font-weight: bold
    background-color: rgba(0,0,0,0)
  
  right: 15px
  top: 0px
"""
