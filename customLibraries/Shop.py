from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:

    def __init__(self):
        self.sellib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("Hello World")

    @keyword
    def add_item_to_cart_and_checkout(self,productslists):
        i = 1
        productsTitles = self.sellib.get_webelements("css:.card-title")
        for productsTitle in productsTitles:
            if productsTitle.text in productslists:
                self.sellib.click_button("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")
            i=i+1
        self.sellib.click_link("css:li.active a")
