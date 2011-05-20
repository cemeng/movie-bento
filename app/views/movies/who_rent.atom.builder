atom_feed do |feed|
  feed.title "Who rent #{@movie.title}"

  latest_rent = @movie.orders.sort_by( &:updated_at ).last
  feed.updated( latest_rent && latest_rent.updated_at )

  @movie.orders.each do |order|

    feed.entry(order) do |entry|
      entry.title "Order #{order.id}"
      entry.overview :type => 'xhtml' do |xhtml|
        xhtml.p "Shipped to #{order.address}"

        xhtml.table do
          xhtml.tr do
            xhtml.th 'Product'
            xhtml.th 'Qty'
          end

          order.cart_items do |item|
            xhtml.tr do
              xhtml.td item.movie.title
              xhtml.td item.quantity
            end
          end

          xhtml.tr do
            xhtml.th 'total', :colspan => 2
            xhtml.th
          end
        end
        xhtml.p "Paid by #{order.pay_type}"
      end

      entry.author do |author|
        entry.name order.name
        entry.email order.email
      end

    end

  end


end