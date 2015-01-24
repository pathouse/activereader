class TextExportController < ApplicationController
  before_action :load_user

  def index
    zipfile = ClippingExporter::Text.new(@user).export
    send_file zipfile.path, type: 'application/zip',
                            disposition: 'attachment',
                            filename: "active_reader_export_#{Time.now}.zip"
    zipfile.close
  end
end
