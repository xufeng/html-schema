require 'spec_helper'

describe HTMLSchema do
  context ":output" do
    before do
      @schema = HTMLSchema.instance
    end
    
    context ":organization" do
      before do
        @organization = @schema.organization
      end
      
      it "should have attributes" do
        @organization.to_hash.should              == {
          :itemscope => "itemscope", 
          :itemtype  => "http://schema.org/Organization",
          :class     => "org"
        }
        
        @organization.name.to_hash.should        == {:itemprop => "name", :class => "organization-name"}
        @organization.description.to_hash.should  == {:itemprop => "description", :class => "description"}
        @organization.url.to_hash.should          == {:itemprop => "url", :class => "url"}
        @organization.image.to_hash.should        == {:itemprop => "image", :class => "image"}
      end
    end
    
    context ":person" do
      before do
        @person = @schema.person
      end
      
      it "should have attributes" do
        @person.to_hash.should              == {
          #:itemprop  => "person", 
          :itemscope => "itemscope", 
          :itemtype  => "http://schema.org/Person",
          :class     => "vcard"
        }
        @person.name.to_hash.should         == {:itemprop => "name", :class => "fn"}
        @person.url.to_hash.should          == {:itemprop => "url", :class => "url"}
        @person.image.to_hash.should        == {:itemprop => "image", :class => "image"}
      end
    end
    
    context ":address" do
      before do
        @address = @schema.address
      end
      
      it "should have attributes" do
        @address.to_hash.should              == {
          #:itemprop  => "address", 
          :itemscope => "itemscope", 
          :itemtype  => "http://schema.org/PostalAddress",
          :class     => "adr"
        }
        @address.name.to_hash.should         == {:itemprop => "name", :class => "name"}
        @address.url.to_hash.should          == {:itemprop => "url", :class => "url"}
        @address.image.to_hash.should        == {:itemprop => "image", :class => "image"}
      end
    end
  end
end
