command: "pmset -g batt | grep 'AC Power' -o;"

refreshFrequency: 1000 # ms

render: (output) ->
  """
  <div class="charging"
    <span></span>
    <span></span>
  </div>
  """

update: (output, el) ->
  $(".charging span:first-child", el).text("#{ @icon(output) }")

icon: (output) =>
  return if output is "AC Power\n"
    "∙"
  else
    ""

style: """
  top: 0px
  right: 54px
  background-color: rgba(0,0,0,0)

  .charging 
    font: 16px "Terminus (TTF)"
    font-weight: bold
"""
