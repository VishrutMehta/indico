# -*- coding: utf-8 -*-
##
##
## This file is part of Indico.
## Copyright (C) 2002 - 2012 European Organization for Nuclear Research (CERN).
##
## Indico is free software; you can redistribute it and/or
## modify it under the terms of the GNU General Public License as
## published by the Free Software Foundation; either version 3 of the
## License, or (at your option) any later version.
##
## Indico is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Indico;if not, see <http://www.gnu.org/licenses/>.

from MaKaC.common.general import *

from MaKaC.webinterface.rh import fileModif

def index(req, **params):
#    import wingdbstub
#    if wingdbstub.debugger != None: 
#        wingdbstub.debugger.StartDebug()
    
    return fileModif.RHFileModification( req ).process( params )

def modifyData(req, **params):
    return fileModif.RHFileModifyData( req ).process( params )

def performModifyData(req, **params):
    return fileModif.RHFilePerformModifyData( req ).process( params )