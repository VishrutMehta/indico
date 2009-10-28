from MaKaC.webinterface.rh import base

class RHSwitch(base.RH):

    def _checkParams(self, params):
        self._whereTo = params.get('to','future')

        if self._whereTo not in ['past', 'future']:
            raise Exception('Unknown value')

        self._returnURL = params.get( "returnURL", "")

    def _process( self ):
        self._req.headers_out["Set-Cookie"] = "INDICO_INTERFACE=%s; domain=.cern.ch;" % self._whereTo

        url = self._returnURL

        if self._whereTo == 'future':
            url = url.replace('indico.cern.ch','indicobeta.cern.ch')
        else:
            url = url.replace('indicobeta.cern.ch','indico.cern.ch')
        self._redirect(url)
