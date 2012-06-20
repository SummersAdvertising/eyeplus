# Only show the next 5 subsequent pages. i.e. <- prev 2,3,4,5,6 next ->
module SearchPagination
  class LinkRenderer < WillPaginate::ActionView::LinkRenderer
    protected
    def windowed_page_numbers
      inner_window = @options[:inner_window].to_i
      window_from = current_page
      window_to = current_page + inner_window

      # adjust upper limit if out of bounds
      window_to = total_pages if window_to > total_pages
      left = (window_from..window_to).to_a
      left << :gap if total_pages > window_to
      left
    end
  end

  class PaginationListLinkRenderer < WillPaginate::ViewHelpers::LinkRenderer

    protected

      def page_number(page)
        unless page == current_page
          tag(:li, link(page, page, :rel => rel_value(page)))
        else
          tag(:li, page, :class => "current")
        end
      end

      def previous_or_next_page(page, text, classname)
        if page
          tag(:li, link(text, page), :class => classname)
        else
          tag(:li, text, :class => classname + ' disabled')
        end
      end

      def html_container(html)
        tag(:ul, html, container_attributes)
      end
  end
end