/* global describe, it, before */

const { expect } = require("chai");
const loadGhostRider = require("../lib/ghostrider");

const { fox, empty, dash, longDream, buffer } = require("./fixtures");

describe("ghostrider", () => {
  let ghostrider;
  before(async () => {
    ghostrider = await loadGhostRider();
  });

  describe("hashes", () => {
    it("empty string", async () => {
      expect(ghostrider.digest(empty).toString("hex")).to.equal(
        "51b572209083576ea221c27e62b4e22063257571ccb6cc3dc3cd17eb67584eba",
      );
    });

    it("fox string", () => {
      expect(ghostrider.digest(fox).toString("hex")).to.equal(
        "534536a4e4f16b32447f02f77200449dc2f23b532e3d9878fe111c9de666bc5c",
      );
    });

    it("dash string", () => {
      expect(ghostrider.digest(dash).toString("hex")).to.equal(
        "fe809ebca8753d907f6ad32cdcf8e5c4e090d7bece5df35b2147e10b88c12d26",
      );
    });

    it("dream string", () => {
      expect(ghostrider.digest(longDream).toString("hex")).to.equal(
        "5c0996b9d49dbe84e29f1b818c1fa9e73549f894a71b8a258964b8f0ecf3c866",
      );
    });

    it("buffer", () => {
      expect(ghostrider.digest(buffer).toString("hex")).to.equal(
        "01840edc7f98704e3c66c6fcad1e90642a382f7c1cb4af64ed085cc50c000000",
      );
    });
  });
});
