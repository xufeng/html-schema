class HTMLSchema
  class Microformat < HTMLSchema::Object
    type :address, :as => :adr do
      #adr type: INTL, POSTAL, PARCEL, WORK, dom, home, pref
      #tel type: VOICE, home, msg, work, pref, fax, cell, video, pager, bbs, modem, car, isdn, pcs
      #email type: INTERNET, x400, pref
      
      attribute :street, :as => :"street-address"
      attribute :suite, :as => :"extended-address"
      attribute :city, :as => :locality
      attribute :state, :as => :region
      attribute :postal_code, :as => :"postal-code"
      attribute :post_office_box, :as => :"post-office-box"
      attribute :country, :as => :"country-name"
    end
    
    type :composition, :as => :hentry do
      attribute :feed, :as => :hfeed
      attribute :title, :as => :"entry-title", :required => true
      attribute :body, :as => :"entry-content"
      attribute :description, :as => :"entry-summary"
      attribute :updated_at, :as => :updated, :type => :date, :required => true
      attribute :published_at, :as => :published, :type => :date
      attribute :author, :type => :person, :required => true
      attribute :bookmark
      attribute :tag, :rel => :tag
      
      type :article, :as => :hnews do
        attribute :organization, :as => :"source-org", :type => :organization
        attribute :location, :as => :"dateline", :type => :place
        attribute :coordinates, :as => :geo, :type => :coordinates
        attribute :license, :as => :"item-license"
      end
    end
    
    type :event, :as => :vevent do
      attribute :feed, :as => :vcalendar
      attribute :description, :as => :summary
      attribute :start_date, :as => :dtstart, :type => :date
      attribute :end_date, :as => :dtend, :type => :date # ISO date
      attribute :location, :as => :location, :type => :address
      attribute :url
      attribute :rdate
      attribute :rrule
      attribute :category
      attribute :description
      attribute :uid
      attribute :coordinates, :as => :geo, :type => :coordinates
      attribute :attendee, :type => :person
      attribute :contact, :type => :person
      attribute :organizer, :type => :person
      attribute :image, :as => :attach, :type => :image
      attribute :status
    end
    
    type :license, :as => :item do
      attribute :link, :as => :"item-license"
      attribute :url, :as => :"item-url"
      attribute :author, :as => :attribution, :type => :person
      attribute :organization, :as => :attribution, :type => :organization
    end
    
    type :measurement, :as => :hmeasure do
      type :angle, :as => :hangle
      type :money, :as => :hmoney
      
      attribute :value, :as => :num
      attribute :unit
      attribute :item # (text | hCard | hCalendar)
      # attribute :type, :as => type ? (text, e.g. "height", "width", "weight")
    end
    
    type :media, :audio, :image, :video, :as => :hmedia do
      
      # http://weborganics.co.uk/ns/2009/09/media/0.1/
      attribute :name, :as => :fn
      attribute :author, :as => :contributor, :type => :person
      attribute :url, :as => :photo
      attribute :player
      attribute :link, :as => :enclosure # download
      attribute :duration
    end
      
    type :offer, :as => :hlisting do
      attribute :version
      attribute :action # class == sell | rent | trade | meet | announce | offer | wanted | event | service
      attribute :lister, :type => :person, :required => true
      attribute :published_at, :as => :dtlisted, :type => :date
      attribute :expires_at, :as => :dtexpired, :type => :date
      attribute :price
      attribute :item, :type => :article
      # <span class="item"><span class="fn">Parking space</span></span>, :required => true
      # <span class="tel"><span class="type">home</span><span class="value">14981948194</span></span>
      attribute :description
      attribute :tag
      attribute :link, :as => :permalink
    end
    
    type :person, :as => :vcard do
      attribute :name, :as => :fn
      attribute :address, :as => :adr, :type => :address
      attribute :agent
      attribute :birthday, :as => :bday
      attribute :category
      attribute :class
      attribute :email
      attribute :coordinates, :as => :geo, :type => :coordinates
      attribute :key
      attribute :label
      attribute :logo
      attribute :mailer
      attribute :nickname
      attribute :note
      attribute :organization, :as => :org, :type => :organization
      attribute :photo
      attribute :rev
      attribute :role
      attribute :"sort-string"
      attribute :sound
      attribute :tel
      attribute :job_title, :as => :title
      attribute :tz
      attribute :uid
      attribute :url
      
      type :author, :rel => :author
      type :acquaintance, :rel => :acquaintance
      type :child, :rel => :child
      type :colleague, :rel => :colleague
      type :contact, :rel => :contact
      type :roommate, :rel => :"co-resident"
      type :coworker, :rel => :"co-worker"
      type :crush, :rel => :crush
      type :date, :rel => :date
      type :editor, :rel => :editor
      type :fan, :rel => :fan
      type :friend, :rel => :friend
      type :kin, :rel => :kin
      type :me, :rel => :me
      type :met, :rel => :met
      type :muse, :rel => :muse
      type :neighbor, :rel => :neighbor
      type :sibling, :rel => :sibling
      type :spouse, :rel => :spouse
      type :sweetheart, :rel => :sweetheart
      type :member, :rel => :member
      type :sponsor, :rel => :sponsor
      type :user, :rel => :user
    end
        
    type :organization, :as => :org do
      attribute :name, :as => :"organization-name"
      attribute :unit, :as => :"organization-unit"
    end
    
    type :product, :as => :hProduct do
      attribute :brand, :as => :organization
      attribute :category
      attribute :price
      attribute :description
      attribute :name, :as => :fn
      attribute :image, :as => :photo
      attribute :url
      attribute :review, :type => :review
      attribute :listing, :type => :offer
      attribute :uid, :as => :identifier
    end
    
    type :rating do
      attribute :best
      attribute :worst
      attribute :value
    end
    
    type :resume, :as => :hresume do
      attribute :description, :as => :summary
      attribute :contact, :type => :person
      attribute :education, :type => :event
      attribute :experience, :type => :event
      attribute :skill
      attribute :affiliation, :type => :organization
      attribute :citation, :type => :citation
    end
    
    type :review, :as => :hReview do
      attribute :version
      attribute :summary
      attribute :kind, :as => :type # product | business | event | person | place | website | url
      attribute :event, :as => :item, :type => :event
      attribute :item, :type => :person
      attribute :reviewer, :type => :person
      attribute :reviewed_at, :as => :dtreviewed, :type => :date
      attribute :rating, :type => :rating
      attribute :description
      attribute :tag, :rel => :tag
      attribute :url, :as => :permalink, :rel => :bookmark
      attribute :license
    end
      
    type :value do
      attribute :kind, :as => :type
      attribute :value
    end
  end
end
