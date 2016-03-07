module IOSConfigProfile
  class SCEPPayload < Hash
    include IOSConfigProfile::BasicPayload

    attr_accessor :url

    def initialize(url)
      self.url = url
      require_attributes :url
      merge! security_payload
    end

    private

    def security_payload
      {
        'PayloadContent' => {
          "URL" => url,
          # 'Name' => '#{IOSConfigProfile.organization} SCEP Payload',
          # 'Subject' => '',
          # FIXME
          'Challenge' => 'foobar',
          # 'Keysize' => 1024,
          # 'Key Type' => 'RSA',
          # 'Key Usage' => 5,
        },

        "PayloadType" => "com.apple.security.scep",
        "PayloadUUID" => uuid,
        "PayloadVersion" => 1,
        "PayloadIdentifier" => "#{IOSConfigProfile.root_domain}.profile.scep",
        "PayloadDisplayName" => "Security",
        "PayloadDescription" => "Provides device authentication (certificate or identity).",
        "PayloadOrganization" => IOSConfigProfile.organization,
      }
    end
  end
end
