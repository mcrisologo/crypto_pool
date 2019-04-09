# frozen_string_literal: true

module ApiHelpers
  module Logs
    extend ::Grape::API::Helpers

    def logger
      API.logger
    end

    def reset_paper_trail_meta
      PaperTrail.request.controller_info = nil
    end

    def set_paper_trail_meta
      return unless current_user

      PaperTrail.request.controller_info = {
        whodunnit: current_user.id
      }
    end
  end
end
