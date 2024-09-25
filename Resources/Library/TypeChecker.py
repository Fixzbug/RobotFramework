# To make it a Robot Framework library
from robot.api.deco import keyword


class TypeChecker:
    @keyword
    def get_type(self, variable):
        return str(type(variable))
