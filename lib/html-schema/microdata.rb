class HTMLSchema
  class Microdata
    extend HTMLSchema::DSL
    
    type :object do
      attribute :name
      attribute :title
      attribute :url
      attribute :description
      attribute :image
      
      type :contact, :as => :Contact do
        attribute :kind, :as => :contactType # sales contact, PR, etc.
        attribute :email
        attribute :fax, :as => :faxNumber
        attribute :phone, :as => :telephone

        type :address, :as => :PostalAddress do
          attribute :street, :as => :streetAddress
          attribute :city, :as => :addressLocality
          attribute :state, :as => :addressRegion
          attribute :postal_code, :as => :postalCode
          attribute :post_office_box, :as => :postOfficeBoxNumber
          attribute :country, :as => :addressCountry#, :type => :place, :source => :country
        end
      end

      type :composition, :as => :Composition do
        attribute :abstract, :as => :about, :type => :base
        attribute :average_rating, :as => :aggregateRating, :type => :rating
        attribute :awards
        attribute :rating, :as => :contentRating, :type => :rating
        attribute :genre
        attribute :headline
        # http://tools.ietf.org/html/bcp47
        attribute :language, :as => :inLanguage
        attribute :interaction_count, :as => :interactionCount
        attribute :family_friendly, :as => :isFamilyFriendly, :type => :boolean
        attribute :tag, :as => :keywords
        attribute :offer, :as => :offers, :type => :offer
        attribute :review, :as => :reviews, :type => :review

        # people and organizations
        attribute :editor, :type => :person
        attribute :author, :type => :person
        attribute :organization, :as => :author, :type => :organization
        attribute :publisher, :type => :organization

        # addresses
        attribute :location, :as => :contentLocation, :type => :place

        # media
        attribute :videa, :type => :media, :source => :video
        attribute :encoding, :as => :encodings, :type => :media
        attribute :audio, :type => :media, :source => :audio

        # dates
        attribute :published_at, :as => :datePublished, :type => :date

        type :blog, :as => :Blog
        type :book, :as => :Book
        type :list, :as => :ItemList
        type :map, :as => :Map
        type :movie, :as => :Movie
        type :recording, :as => :MusicRecording
        type :painting, :as => :Painting
        type :photo, :as => :Photograph
        type :sculpture, :as => :Sculpture
        type :episode, :as => :TVEpisode
        type :season, :as => :TVSeason
        type :series, :as => :TVSeries

        type :article, :as => :Article do
          attribute :body, :as => :articleBody
          attribute :section, :as => :articleSection

          type :article, :as => :Article do
            type :blog_post, :as => :BlogPosting
            type :news_article, :as => :NewsArticle
            type :academic_article, :as => :ScholarlyArticle
          end
        end

        type :media, :as => :MediaObject do
          attribute :bitrate
          attribute :size, :as => :contentSize
          attribute :url, :as => :contentURL
          attribute :embed_url, :as => :embedURL
          attribute :duration, :as => :measurement
          attribute :composition, :as => :encodesCreativeWork, :type => :composition
          attribute :format, :as => :encodingFormat
          attribute :expiration_date, :as => :expires, :type => :date
          attribute :height, :type => :measurement
          attribute :width, :type => :measurement
          attribute :player, :as => :playerType # flash, silverlight, etc.
          attribute :allowed_in, :as => :regionsAllowed, :type => :place
          attribute :subscription_required, :as => :requiresSubscription, :type => :boolean
          attribute :upload_date, :as => :uploadDate, :type => :date

          type :audio, :as => :AudioObject
          type :music_video, :as => :MusicVideoObject
          type :video, :as => :VideoObject

          type :image, :as => :ImageObject do
            attribute :caption
            attribute :exif, :as => :exifData
            attribute :main, :as => :representativeOfPage, :type => :boolean
            attribute :thumbnail, :type => :image
          end
        end

        type :playlist, :as => :MusicPlaylist do
          type :album, :as => :MusicAlbum
        end

        type :recipe, :as => :Recipe
        type :review, :as => :Review do
          attribute :item, :as => :itemReviewed, :type => :base
          attribute :content, :as => :reviewBody
          attribute :rating, :as => :reviewRating, :type => :rating
        end

        type :webpage, :as => :WebPage do
          type :about_page, :as => :AboutPage
          type :checkout_page, :as => :CheckoutPage
          type :index_page, :as => :CollectionPage
          type :contact_page, :as => :ContactPage
          type :show_page, :as => :ItemPage
          type :profile_page, :as => :ProfilePage
          type :search_page, :as => :SearchResultsPage
        end

        type :widget, :as => :WebPageElement do
          type :menu_item, :as => :SiteNavigationElement
          type :table, :as => :Table
          type :ad, :as => :WPAdBlock
          type :footer, :as => :WPFooter
          type :header, :as => :WPHeader
          type :sidebar, :as => :WPSideBar
        end
      end

      type :event, :as => :Event do
        type :arts, :as => :VisualArtsEvent
        type :business, :as => :BusinessEvent
        type :chidrens, :as => :ChildrensEvent
        type :comedy, :as => :ComedyEvent
        type :dance, :as => :DanceEvent
        type :education, :as => :EducationEvent
        type :festival, :as => :Festival
        type :food, :as => :FoodEvent
        type :literary, :as => :LiteraryEvent
        type :music, :as => :MusicEvent
        type :sale, :as => :SaleEvent
        type :social, :as => :SocialEvent
        type :sports, :as => :SportsEvent
        type :theater, :as => :TheaterEvent

        attribute :attendee, :as => :attendees, :type => :person
        attribute :duration, :type => :base, :source => :duration
        attribute :end_date, :as => :endDate, :type => :date
        attribute :start_date, :as => :startDate, :type => :date
        attribute :location, :type => :address
        attribute :place, :as => :location, :type => :place
        attribute :offer, :as => :offers, :type => :offer
        attribute :performer, :as => :performers, :type => :person
        attribute :child_event, :as => :subEvents, :type => :event
        attribute :parent_event, :as => :superEvent, :type => :event

        type :user_interaction, :as => :UserInteraction do
          type :user_blocks, :as => :UserBlocks
          type :user_checkin, :as => :UserCheckins
          type :user_comments, :as => :UserComments
          type :user_downloads, :as => :UserDownloads
          type :user_likes, :as => :UserLikes
          type :user_page_views, :as => :UserPageVisits
          type :user_plays, :as => :UserPlays
          type :user_votes, :as => :UserPlusOnes
          type :user_tweets, :as => :UserTweets
        end
      end

      type :intangible, :as => :Intangible do
        type :intangible, :as => :Enumeration do
          type :intangible, :as => :BookFormatType do
            type :intangible, :as => :EBook
            type :intangible, :as => :Hardcover
            type :intangible, :as => :Paperback
          end
          type :intangible, :as => :ItemAvailability do
            type :intangible, :as => :Discontinued
            type :intangible, :as => :InStock
            type :intangible, :as => :InStoreOnly
            type :intangible, :as => :OnlineOnly
            type :intangible, :as => :OutOfStock
            type :intangible, :as => :PreOrder
          end
          type :intangible, :as => :OfferItemCondition do
            type :intangible, :as => :DamagedCondition
            type :intangible, :as => :NewCondition
            type :intangible, :as => :RefurbishedCondition
            type :intangible, :as => :UsedCondition
          end
        end
        type :intangible, :as => :Language
        type :quantity, :as => :Quantity do
          type :quantity, :as => :Distance
          type :quantity, :as => :Duration
          type :quantity, :as => :Energy
          type :quantity, :as => :Mass
        end

        type :offer, :as => :Offer do
          attribute :rating, :as => :aggregateRating, :type => :rating
          attribute :availability, :source => :item_availability
          attribute :condition, :as => :itemCondition, :source => :offer_item_condition
          attribute :item, :as => :itemOffered, :type => :product
          attribute :price
          attribute :min_price, :as => :lowPrice
          attribute :max_price, :as => :highPrice
          attribute :currency, :as => :priceCurrency # in 3-letter ISO 4217 format
          attribute :valid_until_date, :as => :priceValidUntil, :type => :date
          attribute :review, :as => :reviews, :type => :review
          attribute :seller, :type => :organization
          attribute :count, :as => :offerCount

          type :aggregate, :as => :AggregateOffer
        end

        type :intangible, :as => :StructuredValue do
          type :rating do
            attribute :best, :as => :bestRating
            attribute :value, :as => :ratingValue
            attribute :worst, :as => :worstRating
            attribute :item, :as => :itemReviewed, :type => :base
            attribute :rating_count, :as => :ratingCount
            attribute :review_count, :as => :reviewCount
          end
          type :coordinates, :as => :GeoCoordinates do
            attribute :elevation, :type => :measurement
            attribute :latitude, :type => :measurement
            attribute :longitude, :type => :measurement
          end
        end
      end

      type :organization, :as => :Organization do
        attribute :address, :type => :address
        attribute :average_rating, :as => :aggregateRating, :type => :rating
        attribute :contact, :as => :contactPoints, :type => :contact
        attribute :email
        attribute :employee, :as => :employees, :type => :person
        attribute :event, :as => :events, :type => :event
        attribute :fax, :as => :faxNumber
        attribute :founder, :as => :founders, :type => :person
        attribute :founding_date, :as => :foundingDate, :type => :date

        type :corporation, :as => :Corporation
        type :educational_institution, :as => :EducationalOrganization do
          type :college, :as => :CollegeOrUniversity
          type :elementary_school, :as => :ElementarySchool
          type :high_school, :as => :HighSchool
          type :middle_school, :as => :MiddleSchool
          type :pre_school, :as => :Preschool
          type :school, :as => :School
        end

        type :governmental_institution, :as => :GovernmentOrganization

        type :vendor, :as => :LocalBusiness do
          attribute :branch_of, :as => :branchOf, :type => :organization
          attribute :hours, :as => :openingHours
          attribute :currency, :as => :currenciesAccepted # The currency accepted (in ISO 4217 currency format).
          attribute :payment_method, :as => :paymentAccepted # Cash, credit card, etc.
          attribute :price_range, :as => :priceRange # i.e. "$$$"
          # for restaurant only only
          attribute :menu
          attribute :reservations, :as => :acceptsReservations # Either Yes/No, or a URL at which reservations can be made.
          attribute :cuisine, :as => :servesCuisine

          type :vendor, :as => :AnimalShelter
          type :vendor, :as => :AutomotiveBusiness do
            type :vendor, :as => :AutoBodyShop
            type :vendor, :as => :AutoDealer
            type :vendor, :as => :AutoPartsStore
            type :vendor, :as => :AutoRental
            type :vendor, :as => :AutoRepair
            type :vendor, :as => :AutoWash
            type :vendor, :as => :GasStation
            type :vendor, :as => :MotorcycleDealer
            type :vendor, :as => :MotorcycleRepair
          end
          type :vendor, :as => :ChildCare
          type :vendor, :as => :DryCleaningOrLaundry
          type :vendor, :as => :EmergencyService do
            type :vendor, :as => :FireStation
            type :vendor, :as => :Hospital
            type :vendor, :as => :PoliceStation
          end
          type :vendor, :as => :EmploymentAgency
          type :vendor, :as => :EntertainmentBusiness
          type :vendor, :as => :FinancialService
          type :vendor, :as => :FoodEstablishment
          type :vendor, :as => :GovernmentOffice
          type :vendor, :as => :HealthAndBeautyBusiness
          type :vendor, :as => :HomeAndConstructionBusiness
          type :vendor, :as => :InternetCafe
          type :vendor, :as => :Library
          type :vendor, :as => :LodgingBusiness
          type :vendor, :as => :MedicalOrganization
          type :vendor, :as => :ProfessionalService
          type :vendor, :as => :RadioStation
          type :vendor, :as => :RealEstateAgent
          type :vendor, :as => :RecyclingCenter
          type :vendor, :as => :SelfStorage
          type :vendor, :as => :ShoppingCenter
          type :vendor, :as => :SportsActivityLocation
          type :vendor, :as => :Store
          type :vendor, :as => :TelevisionStation
          type :vendor, :as => :TouristInformationCenter
          type :vendor, :as => :TravelAgency
        end

        type :ngo, :as => :NGO
        type :performing_group, :as => :PerformingGroup
        type :sports_team, :as => :SportsTeam
      end

      type :person, :as => :Person do
        # addresses
        attribute :address, :type => :address
        attribute :home_address, :as => :homeLocation, :type => :place
        attribute :work_address, :as => :workLocation, :type => :place

        # organizations
        attribute :organization, :type => :organization
        attribute :education, :type => :organization, :source => :education
        attribute :membership, :type => :organization
        attribute :company, :type => :organization, :as => :worksFor

        # events
        attribute :performer_in, :type => :event, :as => :performerIn

        # dates
        attribute :born_on, :type => :date, :as => :birthDate
        attribute :died_on, :type => :date, :as => :deathDate

        # relationships
        attribute :children, :type => :person
        attribute :parents, :type => :person
        attribute :siblings, :type => :person
        attribute :spouse, :type => :person
        attribute :relationship, :type => :person, :as => :relatedTo
        attribute :colleagues, :type => :person
        # unidirectional
        attribute :follows, :type => :person
        # bidirectional
        attribute :knows, :type => :person

        # info
        attribute :contact_info, :type => :contact, :as => :contactPoints
        attribute :email
        attribute :phone, :as => :telephone
        attribute :fax, :as => :faxNumber
        attribute :gender
        attribute :interaction_count, :as => :interactionCount
        attribute :job_title, :as => :jobTitle
        attribute :nationality, :type => :place, :source => :country
      end

      type :place, :as => :Place do
        attribute :address, :type => :address
        attribute :rating, :type => :rating, :as => :aggregateRating
        attribute :surrounding, :type => :place, :as => :containedIn
        attribute :event, :type => :event, :as => :events
        attribute :fax, :as => :faxNumber
        attribute :coordinates, :type => :coordinates, :as => :geo
        attribute :interaction_count, :as => :interactionCount
        attribute :map, :as => :maps
        attribute :image, :type => :image, :as => :photos
        attribute :review, :type => :review, :as => :reviews
        attribute :phone, :as => :telephone

        type :place, :as => :AdministrativeArea do
          type :place, :as => :City
          type :place, :as => :Country
          type :place, :as => :State
        end

        type :place, :as => :LandmarksOrHistoricalBuildings
        type :place, :as => :TouristAttraction

        type :place, :as => :CivicStructure do
          attribute :hours, :as => :openingHours

          type :place, :as => :Airport
          type :place, :as => :Aquarium
          type :place, :as => :Beach
          type :place, :as => :BusStation
          type :place, :as => :BusStop
          type :place, :as => :Campground
          type :place, :as => :Cemetery
          type :place, :as => :Crematorium
          type :place, :as => :EventVenue
          type :place, :as => :FireStation
          type :place, :as => :GovernmentBuilding
          type :place, :as => :Hospital
          type :place, :as => :MovieTheater
          type :place, :as => :Museum
          type :place, :as => :MusicVenue
          type :place, :as => :Park
          type :place, :as => :ParkingFacility
          type :place, :as => :PerformingArtsTheater
          type :place, :as => :PlaceOfWorship
          type :place, :as => :Playground
          type :place, :as => :PoliceStation
          type :place, :as => :RVPark
          type :place, :as => :StadiumOrArena
          type :place, :as => :SubwayStation
          type :place, :as => :TaxiStand
          type :place, :as => :TrainStation
          type :place, :as => :Zoo
        end

        type :place, :as => :Landform do
          type :place, :as => :BodyOfWater
          type :place, :as => :Continent
          type :place, :as => :Mountain
          type :place, :as => :Volcano
        end

        type :place, :as => :Residence do
          type :place, :as => :ApartmentComplex
          type :place, :as => :GatedResidenceCommunity
          type :place, :as => :SingleFamilyResidence
        end
      end

      type :product, :as => :Product do
        attribute :rating, :as => :aggregateRating, :type => :rating
        attribute :brand, :type => :organization
        attribute :manufacturer, :type => :organization
        attribute :model
        attribute :offer, :as => :offers, :type => :offer
        attribute :uid, :as => :productID
        attribute :review, :as => :reviews, :type => :review
      end
    end
  end
end
