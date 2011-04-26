#---
# The Video Kills The Radio Star
#---
# encoding: utf-8
Movie.delete_all
Movie.create(:title => 'King Kong Loves Ping Pong',
  :overview => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :image =>   '/images/wd4d.jpg',    
  :duration => 300,
  :avaibale => true)
# . . .
Movie.create(:title => 'Programming Ruby 1.9',
  :overview =>
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
  :image => '/images/ruby.jpg')
# . . .

Movie.create(:title => 'Rails Test Prescriptions',
  :overview => 
    %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
  :image => '/images/rtp.jpg')
