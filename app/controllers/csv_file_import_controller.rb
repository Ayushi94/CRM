class CsvFileImportController < ApplicationController
	def new
		@csv_file_import = current_user.csv_file_imports.build
	end
end
