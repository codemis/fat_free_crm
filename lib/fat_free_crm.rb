# Fat Free CRM
# Copyright (C) 2008-2011 by Michael Dvorkin
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#------------------------------------------------------------------------------

# Use the Syck YAML parser
require 'fat_free_crm/syck_yaml'

require "fat_free_crm/gem_dependencies"
require "fat_free_crm/gem_ext"
require "fat_free_crm/plugin_dependencies"

# Load Fat Free CRM as a Rails Engine, unless running as a Rails Application
unless defined?(FatFreeCRM::Application)
  require 'fat_free_crm/engine'
end

require "fat_free_crm/version"
require "fat_free_crm/core_ext"
require "fat_free_crm/exceptions"
require "fat_free_crm/errors"
require "fat_free_crm/i18n"
require "fat_free_crm/permissions"
require "fat_free_crm/exportable"
require "fat_free_crm/renderers"
require "fat_free_crm/fields"
require "fat_free_crm/sortable"
require "fat_free_crm/tabs"
require "fat_free_crm/callback"
require "fat_free_crm/dropbox" if defined?(::Rake)
require "fat_free_crm/plugin"


module FatFreeCRM
  # Return the root path of either the Application or the Engine,
  # depending on how Fat Free CRM is loaded
  def self.root
    (defined?(FatFreeCRM::Engine) ? Engine : Application).root
  end
end