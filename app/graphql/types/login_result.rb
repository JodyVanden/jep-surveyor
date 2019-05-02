module Types
  class LoginResult < Types::BaseUnion
    possible_types SuccessfulLoginResult,
      FailedLoginResult, DocumentNotFoundError

    def self.resolve_type(object, _context)
      if object
        SuccessfulLoginResult
      else
        FailedLoginResult
      end
    end
  end
end