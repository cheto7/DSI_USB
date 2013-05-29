/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author karen
 */
import java.math.BigInteger;
import java.security.SecureRandom;

public final class Contrasena {

  private SecureRandom random = new SecureRandom();

  public String nextSessionId()
  {
    return new BigInteger(50, random).toString(16);
  }

}
