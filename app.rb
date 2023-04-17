require 'sinatra'

get '/' do
# Texte de base
  tooltip = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed faucibus aliquam massa, sed interdum orci tempor non. Quisque porttitor, velit sit amet vestibulum sollicitudin, sapien lorem mollis urna, in ullamcorper quam nisi nec nisl. Vestibulum lobortis massa quis ligula consectetur bibendum. Vivamus pulvinar nunc in risus sagittis, eget volutpat urna viverra. Ut luctus vel lacus quis iaculis. Sed sed pharetra nisi. Etiam hendrerit, nibh ut lobortis rutrum, lectus nulla fermentum velit, ac ultricies erat nisl id sapien. Nulla facilisi. Duis a elit mi. Morbi vitae suscipit risus. Sed placerat lorem nec felis auctor, in interdum quam pharetra. Praesent suscipit est eget massa efficitur tempus. Fusce pulvinar aliquet arcu, vitae lacinia odio molestie ut."
# Defirnir les position des marks
  positions = [
    { start: 20, end: 35, comment: "Foo" },
    { start: 50, end: 98, comment: "Baz" },
    { start: 73, end: 92, comment: "Bar" },
  ]

  toolkip_text = highlight_text(tooltip, positions)
  erb :index, locals: { tooltip: toolkip_text }
end

helpers do
  def highlight_text(tooltip, positions)
    toolkip_text = tooltip.dup
    positions.each do |position|
      debut = position[:start]
      fin = position[:end]
      mots = tooltip.slice(debut..fin)
      highlighted_keyword = "<mark data-bs-toggle='tooltip' data-bs-placement='top' title='#{position[:comment]}'>#{mots}</mark>"
      toolkip_text.gsub!(mots, highlighted_keyword)
    end
    toolkip_text
  end
end
