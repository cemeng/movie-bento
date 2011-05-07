#---
# The Video Kills The Radio Star
#---
# encoding: utf-8
Cart.delete_all

Rating.delete_all
Rating.create( :code => 'E', :title => 'Exempt from Classification', 
:description => 'Only very specific types of material (including educational material and straight records of artistic performances) can be exempted from classification, and the material cannot contain anything that might lead to an M rating or higher.', :image => '/images/exempt.png' )
Rating.create( :code => 'G', :title => 'General Exhibition', 
:description => "These films and computer games are for general viewing. However, G does not necessarily designate a children's film or game as many of these productions contain content that would be of no interest to children.", :image => '/images/general.png' )
Rating.create( :code => 'PG', :title => 'Parental guidance recommended', 
:description => 'Contains material which young children may find confusing or upsetting, and may require parental supervision. It is not recommended for those under 8 years of age.', :image => '/images/parental.png' )
Rating.create( :code => 'M', :title => 'Recommended for mature audiences', :description => 'Contains material that requires a mature perspective but is not deemed to strong for younger viewers. It is not recommended for persons under 12 years of age.', :image => '/images/mature.png' )
Rating.create( :code => 'MA15+', :title => 'Mature Accompanied', :description => 'The content is considered unsuitable for exhibition by persons under the age of 15. Persons under this age may only legally purchase or exhibit MA15+ rated content under the supervision of an adult guardian. This is a legally restricted category.', :image => '/images/MA15.png' )





Category.delete_all
Category.create(:name => 'Action/Adventure')
Category.create(:name => 'Children & Family')
Category.create(:name => 'Comedy')
Category.create(:name => 'Drama')
Category.create(:name => 'Foreign/Arthouse')
Category.create(:name => 'Horror & Sci-Fi')
Category.create(:name => 'Music & Musicals')
Category.create(:name => 'Special Interest')
Category.create(:name => 'Sport & Recreation')
Category.create(:name => 'Thriller')
Category.create(:name => 'TV on DVD')
Category.create(:name => 'War')
Category.create(:name => 'Westerns')

Movie.delete_all
Movie.create(:title => 'Harry Potter and The Deathly Hallows - Part 1',
  :overview =>
    %{<p>
        <em>Voldemort's power is growing stronger. 
        He now has control over the Ministry of Magic and Hogwarts. 
        Harry, Ron, and Hermione decide to finish Dumbledore's work and 
        find the rest of the Horcruxes to defeat the Dark Lord. B
        ut little hope remains for the Trio, and the rest of the Wizarding World, 
        so everything they do must go as planned. 
        As Harry races against time and evil to destroy the Horcruxes, 
        he uncovers the existence of three most powerful 
        objects in the wizarding world: the Deathly Hallows.
      </p>},
  :image =>   '/images/deathly-hallows-1.jpg',
  :duration => 300,
  :rating_id => Rating.find_by_code('PG').id,
  :available => true).movie_categories.build(:category_id => Category.find_by_name('Action/Adventure').id ).save
# . . .
Movie.create(:title => '14 Blades',
  :overview =>
    %{<p>
        An elite force of secret agents, the Jinyi Wei, devote their lives and lethal prowess to the service of the Emperor alone. When the Imperial Court is taken over by an evil eunuch, Qinglong (Donnie Yen) is assigned to steal a list identifying those still loyal to the Emperor. However during the mission Qinglong is betrayed and barely escapes with his life. Now the most wanted man in the land, Qinglong must seek out and rally the loyalists to restore the Emperor to power but in his way are his former comrades ? the deadliest assassins in the land.
      </p>},
  :image => '/images/14-blades.jpg',
  :duration => 109,
  :rating_id => Rating.find_by_code('MA15+').id,  
  :available => true).movie_categories.build(:category_id => Category.find_by_name('Foreign/Arthouse').id ).save
# . . .

Movie.create(:title => 'Inception',
  :overview =>
    %{<p>
        Dom Cobb (Leonardo DiCaprio) is a skilled thief, the absolute best in the dangerous art of extraction: stealing valuable secrets from deep within the subconscious during the dream state when the mind is at its most vulnerable. Cobbs rare ability has made him a coveted player in this treacherous new world of corporate espionage, but it has also made him an international fugitive and cost him everything he has ever loved. Now Cobb is being offered a chance at redemption. One last job could give him his life back but only if he can accomplish the impossible -Inception. Instead of the perfect heist, Cobb and his team of specialists have to pull off the reverse; their task is not to steal an idea but to plant one. If they succeed, it could be the perfect crime. But no amount of careful planning or expertise can prepare the team for the dangerous enemy that seems to predict their every move. An enemy that only Cobb could have seen coming. This summer, your mind is the scene of the crime.
      </p>},
  :image => '/images/inception.jpg',  
  :duration => 142,
	:rating_id => Rating.find_by_code('MA15+').id,
  :available => true).movie_categories.build(:category_id => Category.find_by_name('Action/Adventure').id ).save
