class HTMLSchema
  class API < HTMLSchema::Object
    type :address do
      attribute :street
      attribute :suite
      attribute :city
      attribute :state
      attribute :country
      attribute :postal_code
      attribute :post_office_box
    end
    
    type :composition do
      attribute :abstract, :type => [:person, :organization]
      attribute :average_rating, :type => :rating
      attribute :award
      attribute :rating, :type => :rating
      attribute :genre
      attribute :headline
      attribute :language
      attribute :interaction_count
      attribute :family_friendly, :type => :boolean
      attribute :keyword
      attribute :offer, :type => :offer
      attribute :review, :type => :review
      attribute :editor, :type => :person
      attribute :author, :type => :person
      attribute :organization, :type => :organization
      attribute :publisher, :type => :organization
      attribute :location, :type => :address
      attribute :videa, :type => :media
      attribute :encoding, :type => :media
      attribute :audio, :type => :media
      attribute :published_date, :type => :date
      
      type :article do
        attribute :body
        attribute :section
      end
      
      type :media do
        attribute :bitrate
        attribute :size
        attribute :url
        attribute :embed_url
        attribute :composition, :type => :article
        attribute :format
        attribute :player
        attribute :allowed_in, :type => :address
        attribute :subscription_required, :type => :boolean
        attribute :expires_at, :type => :date
        attribute :uploaded_at, :type => :date
        attribute :duration, :as => :measurement
        attribute :height, :type => :measurement
        attribute :width, :type => :measurement
        
        type :audio
        type :image
        type :video
      end
    end
    
    type :coordinates do
      attribute :elevation, :type => :measurement
      attribute :latitude
      attribute :longitude
    end
    
    type :event do
      attribute :child_event, :type => :event
      attribute :parent_event, :type => :event
      attribute :start_date, :type => :date
      attribute :end_date, :type => :date
      attribute :location, :type => :address
      attribute :duration, :type => :measurement
      attribute :offer, :type => :offer
      attribute :attendee, :type => :person
      attribute :performer, :type => :person
      attribute :organization, :type => :organization
    end
    
    type :figure do
      attribute :image
      attribute :legend
      attribute :author, :type => [:person, :organization]
      attribute :subject
    end
    
    type :item do
      attribute :type
      attribute :value
    end
    
    type :measurement do
      attribute :value
      attribute :unit
      attribute :item, :type => [:text, :person, :organization, :media, :event]
    end
    
    type :offer do
      attribute :rating, :type => :rating
      attribute :availability
      attribute :condition
      attribute :item, :type => :product
      attribute :price, :type => :measurement
      attribute :min_price, :type => :measurement
      attribute :max_price, :type => :measurement
      attribute :currency
      attribute :valid_until_date, :type => :date
      attribute :review, :type => :review
      attribute :seller, :type => :organization
      attribute :count
    end
    
    type :organization do
      attribute :address, :type => :address
      attribute :average_rating, :type => :rating
      attribute :contact, :type => [:person, :organization]
      attribute :email
      attribute :employee, :type => :person
      attribute :event, :type => :event
      attribute :fax
      attribute :founder, :type => :person
      attribute :founded_at, :type => :date
      
      type :vendor do
        attribute :branch_of, :type => :organization
        attribute :hours
        attribute :currency
        attribute :payment_method
        attribute :price_range
        attribute :menu
        attribute :reservations
        attribute :cuisine
      end
    end
    
    type :person do
      attribute :address, :type => :address
      attribute :home_address, :type => :address
      attribute :work_address, :type => :address
      
      # organizations
      attribute :organization, :type => :organization
      attribute :education, :type => :organization
      attribute :membership, :type => :organization
      attribute :company, :type => :organization
      
      # events
      attribute :performer_in, :type => :event
      
      # dates
      attribute :born_at, :type => :date
      attribute :died_at, :type => :date
      
      # relationships
      attribute :children, :type => :person
      attribute :parents, :type => :person
      attribute :siblings, :type => :person
      attribute :spouse, :type => :person
      attribute :relationship, :type => :person
      attribute :colleagues, :type => :person
      # unidirectional
      attribute :follows, :type => :person
      # bidirectional
      attribute :knows, :type => :person
      
      # info
      attribute :contact_info, :type => :contact
      attribute :email
      attribute :phone
      attribute :fax
      attribute :gender
      attribute :interaction_count
      attribute :job_title
      attribute :nationality, :type => :place
      
      type :author
      type :acquaintance
      type :child
      type :colleague
      type :contact
      type :roommate
      type :coworker
      type :crush
      type :date
      type :editor
      type :fan
      type :friend
      type :kin
      type :me
      type :met
      type :muse
      type :neighbor
      type :sibling
      type :spouse
      type :sweetheart
      type :member
      type :sponsor
      type :user
    end
    
    type :place do      
      attribute :address, :type => :address
      attribute :rating, :type => :rating
      attribute :surrounding, :type => :place
      attribute :event, :type => :event
      attribute :fax
      attribute :coordinates, :type => :coordinates
      attribute :interaction_count
      attribute :map
      attribute :image, :type => :media
      attribute :review, :type => :review
      attribute :phone
    end
    
    type :product do
      attribute :rating, :type => :rating
      attribute :brand, :type => :organization
      attribute :manufacturer, :type => :organization
      attribute :model
      attribute :offer, :type => :offer
      attribute :review, :type => :review
    end
    
    type :rating do
      attribute :best
      attribute :value
      attribute :worst
      attribute :item, :type => [:person, :event, :media, :place, :organization]
      attribute :rating_count
      attribute :review_count
    end
    
    type :review do
      attribute :body
      attribute :item, :type => [:person, :event, :media, :place, :organization]
      attribute :rating, :type => :rating
    end
  end
end
