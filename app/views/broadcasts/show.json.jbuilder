<h1>solid steel single broadcast</h1>

<ul id="broadcast">
<% @broadcast.mixes.each do |part| %>
	<li class="part"><%= link_to "#{part.name}", broadcast_mix_path(@broadcast, part) %></li>
<% end %>
</ul>