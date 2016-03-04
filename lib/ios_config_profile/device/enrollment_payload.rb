module IOSConfigProfile
  class EnrollmentPayload < Array
    include IOSConfigProfile::BasicPayload

    attr_reader :url, :topic, :scep_url

    def initialize(url, topic, scep_url)
      @url = url
      @topic = topic
      @scep_url = scep_url
      require_attributes :url, :topic, :scep_url
      push security_payload
      push mdm_payload
    end

    def mdm_payload
      @mdm_payload ||= IOSConfigProfile::MDMPayload.new(url, security_payload, topic)
    end

    def security_payload
      @security_payload ||= IOSConfigProfile::SCEPPayload.new(scep_url)
    end
  end
end
