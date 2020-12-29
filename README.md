# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# salvage_yard

<% if @cart.empty? %>
    <p>The cart is empty</p>
<% end %>

<div class="container">
    
    <table id="customers">
        
            <% total = 0 %>
        
            <% @cart.each do |id, quantity| %>
            
            <% item = Item.find_by_id(id) %>
            
            <tr>
                <td>
                    <div class="image">
                        <%= link_to (image_tag item.image_url, :style =>"height:40px"), item %>
                    </div>
                
                </td>
                
                <td class="title"><%= link_to item.title, item %></td>
                <td><a href="/cart/remove/<%= item.id %>">Remove From Cart</a></td>
                <td><a href="cart/increase/<%= item.id %>" >Increase Items<i class='fas fa-arrow-alt-circledown'></i></a></td>
                <td><a href="cart/reduce/<%= item.id %>" >Reduce Items<i class='fas fa-arrow-alt-circledown'></i></a></td>
                <td class="price"><%= number_to_currency(item.price, :unit =>"€") %></td>
                <td class="quantity"><%= quantity %></td>
                <td class="price"><%= number_to_currency(quantity * item.price, :unit =>"€") %></td>
            
            </tr>
            
            <% total += quantity * item.price %>

            <% end %>
        
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>Grand Total: </td>
            <td>
                <%= number_to_currency(total, :unit => "€") %>
            </td>
        </tr>
        
    </table>
    
    <a href="/items" class="btn btn-primary">Continue Shopping</a>
    <a href="/cart/clear" class="btn btn-primary">Clear Cart</a>
    <a href="/checkout/" class="btn btn-primary">Checkout</a>

</div>
