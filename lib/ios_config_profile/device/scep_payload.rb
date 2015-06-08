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
        'URL' => url,
        #'Name' => 'Cellabus SCEP Payload',
        #'Subject' => '',
        #'Challenge' => '',
        #'Keysize' => 1024,
        #'Key Type' => 'RSA',
        #'Key Usage' => 5,

        'PayloadType' => 'com.apple.security.scep',
        'PayloadVersion' => 1,
        'PayloadIdentifier' => 'com.cellabus.profile.scep',
        'PayloadDisplayName' => 'Security',
        'PayloadDescription' => 'Provides device authentication (certificate or identity).',
        'PayloadOrganization' => ''
      }
    end
  end
end