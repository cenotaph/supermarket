# frozen_string_literal: true

require 'digest/md5'
module Devise
  module Encryptable
    module Encryptors
      class Legacy < Base
        def self.digest(password, _stretches, salt, _pepper)
          str = [password, salt].flatten.compact.join
          Digest::MD5.hexdigest(password)
        end
      end
    end
  end
end
