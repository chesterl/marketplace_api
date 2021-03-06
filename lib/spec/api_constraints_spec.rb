require 'spec_helper'

describe ApiConstraints do
  let(:api_constraints_v1) { ApiConstraints.new(version: 1) }
  let(:api_constraints_v2) { ApiConstraints.new(version: 2, default: true) }

  describe "matches?" do
    it "return true when the version matches the 'Accept' header" do
      request = double(host: 'api.marketplace.dev',
                       headers: {"Accept" => "application/vnd.marketplace.v1" })
      result = api_constraints_v1.matches?(request)
      expect(result).to be_true
    end

    it "returns the default version when 'default' option is specified " do
      request = double(host: 'api.marketplace.dev')
      result = api_constraints_v2.matches?(request)
      expect(result).to be_true
    end

  end
end