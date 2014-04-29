# Evernote's markup language
# http://dev.evernote.com/doc/articles/enml.php
# http://dev.evernote.com/doc/articles/creating_notes.php

# Minimal viable formatting code

module ClippingExporter::FormattingMethods
  module ENML
    def en_note(&block)
      content = block_given? ? yield : ""
      ["<?xml version='1.0' encoding='UTF-8'?>",
       "<!DOCTYPE en-note SYSTEM 'http://xml.evernote.com/pub/enml2.dtd'>",
       "<en-note>", content, "</en-note>"].join("")
    end

    def en_todo(checked=false, &block)
      content = block_given? ? yield : ""
      ["<en-todo checked='#{checked}'>", content, "</en-todo>"].join("")
    end
  end

  module HTML

    def link_to(href, opts={}, &block)
      content = block_given? ? yield : ""
      ["<a href=#{href}#{("," + html_attributes(opts)) unless opts.empty?}>", content, "</a>"].join("")
    end

    [:h1, :h2, :h3, :h4, :h5, :h6, :p, :span, :div, :blockquote, 
     :pre, :code, :small, :strong, :i, :ol, :ul, :li, :cite, :dl, :dt,
     :dd, :em, :q, :strong, :sub, :sup, :u].each do |el|
      
      define_method el, -> (opts={}, &block) do
        content = block.nil? ? "" : block.call
        ["<#{el}#{(" " + html_attributes(opts)) unless opts.empty?}>", content, "</#{el}>"].join("")
      end
    end

    [:hr, :br].each do |single|
      define_method single do
        "<#{single} />"
      end
    end

    def html_attributes(hsh)
      hsh.keys.map {|k| "#{k.to_s.gsub("_","-")}=#{hsh[k]}"}.join(",")
    end

    def element_group(*elements)
      elements.join("")
    end
  end
end

